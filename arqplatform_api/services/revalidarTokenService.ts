import { ResponseApi } from '../interfaces/response';
import { Request } from "express";
import User from '../models/mariadb/user';


export const revalidarTokenService = async (
    req: Request,
  ): Promise<ResponseApi > => {

    const { id } = req.body
    const usuario = await User.findOne({ 
        where: { id: id } })
    return {
        msg: "usuario correcto",
        data: usuario,
        error: null,
      };
  }