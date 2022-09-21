import { Request, Response } from 'express';
import Project from '../models/mariadb/projects';

export const getProjectsService = async () => {
  //traer todos los registros de la tabla
  try {
    const projects = await Project.findAll();
    //formatear fecha de registro
    return projects;
  } catch (error) {
    console.log(error);
  }
};

// crear nuevo proyecto
export const createProjectService = async (req: Request, res: Response) => {
  try {
    const project = await Project.create({ ...req.body });
	  return project;
  } catch (error) {
    console.log(error);
  }
};

export const deleteProjectService = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const project = await Project.destroy({ where: { id } });
    return res.json({
      msg: 'Proyecto eliminado',
      project: project,
    });
  } catch (error) {
    console.log(error);
  }
};

export const putProjectService = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const project = await Project.update(req.body, { where: { id } });
    return res.json({
      msg: 'Proyecto actualizado',
      project: project,
    });
  } catch (error) {
    console.log(error);
  }
};
