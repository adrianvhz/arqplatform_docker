import { Request, Response } from "express";
import bcryptjs from "bcryptjs";
import User from "./../models/mariadb/user";

import Auth from "../utils/auth/Auth";
import { ResponseApi } from "../interfaces/response";
import { Constantes } from "./../config/Constante";

export const loginUserService = async (
  req: Request,
  res: Response
): Promise<ResponseApi > => {
  const { email, password } = req.body;
  try {
    //Verificamos si existe el email
    const usuario = await User.findOne({ 
      where: { email: email } });
    if (!usuario) {
      res.status(404);
      return {
        msg: "Usuario/Passwrod no son correctos - correo",
        data: usuario,
        error: null,
      };
    }
    //validmos el password

    const validPassword = Auth.compareSync(password, usuario.password);
    if (!validPassword) {
      res.status(401);
      return {
        msg: "Usuario/Passwrod no son correctos - password",
        data: usuario,
        error: null,
      };
    }

    //generamos token
    const token = await Auth.generarToken(usuario.id, Constantes.key);

    return {
      msg: "Sesión iniciada correctamente!",
      data: { usuario, token },
      error: null,
      // Cambiar esto. De manera momentanea para persistir la sesion.
    };

    //   if (!token) {
    //       res.status(401);
    //       return {
    //          msg: "Usuario/Passwrod no son correctos - token",
    //          data: {usuario, token},
    //          error: null,
    //       }
    //   };
  } catch (error) {
    res.status(401);
    return {
      msg: "Usuario/Passwrod no son correctos - error",
      data: null,
      error: error,
    };
  }
};
