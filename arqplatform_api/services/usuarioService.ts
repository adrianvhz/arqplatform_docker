import { Request, Response } from "express";
import User from "../models/mariadb/user";
import Auth from "../utils/auth/Auth";
import { Constantes } from "../config/Constante";
import { ResponseApi } from "../interfaces/response";
import Planes from "../models/mariadb/plan";
import DetailUserPlan from "../models/mariadb/detailUserPlan";
import { UserPlanPermiso } from "../interfaces/userplan";
import DetailPlanPermission from "../models/mariadb/detailPlanPermission";
import Permiso from "./../models/mariadb/permiso";
import { Op } from "sequelize";

export const getUsuariosService = () => {
  return;
};

export const getUsuarioService = (req: Request) => {
  const { id } = req.params;
  return { id };
  // const {id} = req.params;
};

export const postUsuarioService = async (req: Request) => {
  //errores de middleware
  req.body.profile_id = 3;
  const { body } = req;
  const { password } = req.body;

  try {
    const user = new User(body);
    const { salt } = Constantes;
    //encriptar contraseña
    user.password = Auth.hashPasswordSync(password, salt);

    const usuario: User = await user.save();
    const plan = await Planes.findOne({ where: { defecto: 1 } });

    const iduser = usuario.id;
    const idplan = plan?.id || 3;
    const datailUserPlan = new DetailUserPlan({
      iduser: iduser,
      idplan: idplan,
      estado: 1,
    });
    await datailUserPlan.save();

    const permisosDetail = await DetailPlanPermission.findAll({
      where: { idplan: idplan },
    });
    let idpermisos: any = [];
    permisosDetail.forEach((p) => {
      idpermisos.push(p.idpermiso);
      //idpermisos.push(p.getDataValue)
    });

    const permisos = await Permiso.findAll({
      where: { id: { [Op.in]: idpermisos } },
    });
    // const permisos  = await Permiso.findAll({where: { id : {[Op.and]: idpermisos } } });

    // console.log(.map)

    const userplanpermiso: UserPlanPermiso = {
      user: usuario,
      plan: plan!,
      permisos: permisos,
    };

    return {
      msg: "Usuario registrado correctamente",
      data: userplanpermiso,
      error: [],
    };
  } catch (error: any) {
    console.log(error);
    return {
      msg: "Ya existe un usuario",
      data: null,
      error: error.errors,
    };
  }
};

export const putUsuarioService = async (
  req: Request ): Promise<ResponseApi> => {
 
  const { salt } = Constantes;
  const {  name, lastname, email,password,flag } = req.body;
  const { id } = req.params

  try {

   //uptdate dates
    if(flag === 1){
      await User.update(
        {
          name: name,
          lastname: lastname,
        },
        { where: { id: id } }
      );
    }

    //update email
    if(flag === 2){
      await User.update(
        {
          email: email,
        },
        { where: { id: id } }
      );
    }

    //update email
    if(flag === 3){

      const passwordNEW = Auth.hashPasswordSync(password, salt);
      await User.update(
        {
          password: passwordNEW,
        },
        { where: { id: id } }
      );
    }
  
  
  

    const user = await User.findOne({ 
      where: { id: id } });
  
    return {
      msg: 'Se actualizo correctamente',
      data: user,
      error: null
    }
    
  } catch (error) {
    
    return {
      msg: 'Ocurrio un error',
      data: null,
      error: null
    }
  }

  // const  {id} = req.params
  // const {body} = req;
};

export const deleteUserService = (req: Request, res: Response) => {
  User.destroy({
    where: { id: req.params.id },
  });
};
