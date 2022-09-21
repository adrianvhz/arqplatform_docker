import { Request } from "express";
import { ResponseApi } from "../interfaces/response";
import Planes from "../models/mariadb/plan";
import DetailUserPlan from "../models/mariadb/detailUserPlan";
import DetailPlanPermission from '../models/mariadb/detailPlanPermission';
import Permiso from './../models/mariadb/permiso';
import { Op } from 'sequelize';

export const addPlanService = async (req: Request): Promise<ResponseApi> => {
  const { body } = req;

  try {
    const plan = new Planes(body);
    const planes = await plan.save();

    return {
      msg: "Plan registrado correctamente",
      data: planes,
      error: [],
    };
  } catch (error: any) {
    return {
      msg: "Ocurrio un error",
      data: {},
      error: error.errors,
    };
  }
};

export const showPlanService = async (req: Request): Promise<ResponseApi> => {
  const { body } = req;
  const { iduser,estado } = body
  try {
   

    const datailUserPlan = await DetailUserPlan.findOne(
      { where: {
        iduser: iduser,
        estado: estado
      }
     })
     const { idplan } = await datailUserPlan!

     const plan  = await Planes.findOne( { where: {
      id: idplan,
      estado: 1
    }})

    const { id } = await plan!
    const permisosDetail = await DetailPlanPermission.findAll({
      where: { idplan: id },
    });

    let idpermisos: any = [];
    permisosDetail.forEach((p) => {
      idpermisos.push(p.idpermiso);
      //idpermisos.push(p.getDataValue)
    });

    const permisos = await Permiso.findAll({
      where: { id: { [Op.in]: idpermisos } },
    });

    return {
      msg: "Plan registrado correctamente",
      data: {plan,permisos},
      error: [],
    };
  } catch (error: any) {
    return {
      msg: "Ocurrio un error",
      data: {},
      error: error.errors,
    };
  }
};
