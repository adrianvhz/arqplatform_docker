

import { Request } from "express";
import { ResponseApi } from '../interfaces/response';
import DetailPlanPermission from "../models/mariadb/detailPlanPermission";

export const detailPlanPermissionService = async (req:Request):  Promise<ResponseApi> => {


    const { body } = req;
    try {
      const detailPP = new DetailPlanPermission(body);

      const detailsPP = await detailPP.save();

      return {
        msg: "Permiso asignado Correctamente al Plan",
        data: detailsPP,
        error: [],
      };
    } catch (error:any) {
      return {
        msg: "Ocurrio un error",
        data: {},
        error: error.errors,
      };
    }
    



}