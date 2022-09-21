import {
	getUsuarioService,
	getUsuariosService,
	postUsuarioService,
	putUsuarioService,
	deleteUserService
} from '../services/usuarioService';
import type { Request, Response } from 'express';
//const usuarioService = require("../services/usuarioService")

export const getUsuarios = (req: Request, res: Response) => {
  const usuarios = getUsuariosService();
  res.json({
    msg: "getUsuarios",
  });

}


export const getUsuario = (req: Request, res: Response) => {
  const { id } = getUsuarioService(req);
  res.json({
    msg: "getUsuario",
    id,
  });
};

export const postUsuario = async (req: Request, res: Response) => {
  
  // const userObject = Object.keys(req.body)
  // console.log(User.name)
  // for (const property in userObject) {
  //       userObject[property] 
  // }
  const resp = await postUsuarioService(req);
  
  try {
    if (resp.error?.length === 0) {
			res.status(201).json(resp);
    } else {
      res.status(401).json(resp);
    }
  } catch (error) {
    return res.status(500).json(error)
  }

};


export const putUsuario = async (req: Request, res: Response) => {
  const usuario = await putUsuarioService(req);
  try {
   
    res.status(200).json(
        usuario
     );
  } catch (error) {
    res.status(401).json(
      usuario
   );
  }
};

export const deleteUser = (req: Request, res: Response) => {
	return deleteUserService(req, res);
}
