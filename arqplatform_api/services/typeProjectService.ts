import { Request } from 'express';
import TypeProject from '../models/mariadb/typeProject';

export const getTypeProjectService = async () => {
  try {
    const typeProjects = await TypeProject.findAll();
    return typeProjects;
  } catch (error) {
    console.log(error);
  }
};
