import { Request, Response } from 'express';
import {
  createProjectService,
  getProjectsService,
  deleteProjectService,
  putProjectService,
} from '../services/projectService';

export const getProject = async (req: Request, res: Response) => {
  const proyectos = await getProjectsService();
  //   const proyectosSinEliminados = proyectos!.filter(proyecto => proyecto.deleted_at === null);
  //formatear fecha de registro y modificado
  res.json({
    msg: 'Proyectos Obtenidos',
    //  proyectos: proyectosSinEliminados,
    proyectos: proyectos,
  });
};

export const createProject = async (req: Request, res: Response) => {
  const proyectos = await createProjectService(req, res);
  // console.log(proyectos);

  res.json({
    msg: 'Proyecto creado',
    proyectos: proyectos,
  });
};

export const deleteProject = async (req: Request, res: Response) => {
  const proyectos = await deleteProjectService(req, res);
  res.json({
    msg: 'Proyecto eliminado',
    proyectos: proyectos,
  });
};

export const putProject = async (req: Request, res: Response) => {
  const proyectos = await putProjectService(req, res);
  res.json({
    msg: 'Proyecto actualizado',
    proyectos: proyectos,
  });
};

export const getProjectById = async (req: Request, res: Response) => {
  const proyectos = await getProjectsService();
  const proyecto = proyectos!.filter(proyecto => proyecto.user_id === +req.params.id);
  res.json({
    msg: 'Proyecto obtenido por ID',
    proyectos: proyecto,
  });
};
