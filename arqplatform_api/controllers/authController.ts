import { Request, Response } from "express";
import { loginUserService,} from "../services/authService";
import { UserI } from "../interfaces/user";
import { revalidarTokenService } from '../services/revalidarTokenService';

//const { generarJWT } = require('../helpers/generar-jwt');

export const loginUser = async (
    req: Request, 
    res: Response) => {

  const resp = await loginUserService(req, res);
  try {
    res.json({
      data:resp
    });
  } catch (error) {
    return res.status(401).json({
      msg: "Algo salio mal",
    });
  }
};

export const revalidarToken = async( 
  req: Request, 
  res: Response) => {

    const resp = await revalidarTokenService(req);

    try {
     return res.status(200).json(resp)
    } catch (error) {
      
    }

}
