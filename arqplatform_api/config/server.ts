import express, { Application } from 'express';
import usuarioRoutes from '../v1/routes/usuarioRoutes';
import authRoutes from '../v1/routes/authRoutes';
import zonesRoutes from '../v1/routes/zonesRoutes';
import typeProjectRoutes from '../v1/routes/typeProjectRoutes';
import projectRoutes from '../v1/routes/projectRoutes';
import permissionRoutes from '../v1/routes/permissionRoutes';
import planRoutes from '../v1/routes/planRoutes';
import detailplanpermission from '../v1/routes/detailPlanPermissionRoutes';
import { apiPaths } from '../api_path/apiPath';
import { Cors } from '../middlewares/cors';
import cookieParser from 'cookie-parser';
import passport from 'passport';
import DataBaseMongo from './dbMongo';
import mariaDB from './dbMariaDb';
import userSession from './userSession';
import type { Request, Response, NextFunction } from 'express';

class Server {
  private app: Application;
  private port: number;
  private apiPaths = apiPaths;
  constructor() {
    this.app = express();
    this.port = parseInt(process.env.PORT_SERVER || "8000", 10);
    this.app.disable('x-powered-by');
    //metodos iniciales
    this.middlewares();
    this.routes();
    this.dbConnection();
    this.session();
  }

  async dbConnection() {
    try {
      // await mariaDB.sync();
      await mariaDB.authenticate();
      console.log('conectado mariadb');
      // const mongodb = new DataBaseMongo()
      // await mongodb.connect();
    } catch (error) {
      console.log(error);
      throw new Error('error en conexión');
    }
  }

  middlewares() {
    //CORS
    this.app.use(Cors);
    //lectura del body
    this.app.use(express.json());

    //carpeta publica
    this.app.use(express.static('public'));
    this.app.use(cookieParser());
  }

  routes() {
    this.app.use(this.apiPaths.auth, authRoutes);
    this.app.use(this.apiPaths.usuarios, usuarioRoutes);
    this.app.use(this.apiPaths.zones, zonesRoutes);
    this.app.use(this.apiPaths.typeProject, typeProjectRoutes);
    this.app.use(this.apiPaths.projects, projectRoutes);
    this.app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
      console.log('error_handler-in');
      res.json({
        statusCode: res.statusCode,
        error: err,
      });
    });
    this.app.use(this.apiPaths.plan, planRoutes);
    this.app.use(this.apiPaths.permisos, permissionRoutes);
    this.app.use(this.apiPaths.detailplanpermission, detailplanpermission);
  }

  session() {
    this.app.use(userSession());
    this.app.use(passport.authenticate('session'));
    // this.app.use(passport.initialize());
    // this.app.use(passport.session());
  }

  listen() {
    this.app.listen(this.port, "0.0.0.0", () => {
      console.log('Servidor corriendo en puerto ' + this.port);
    });
  }
}

export default Server;
