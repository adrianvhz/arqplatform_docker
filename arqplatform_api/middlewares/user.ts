import { NextFunction, Request, Response } from "express";
import { ParamSchema, validationResult } from "express-validator";
import User from "../models/mariadb/user";

export const limitValidate = async (params: ParamSchema) => {
  if (!Number.isInteger(Number(params))) {
    throw new Error(`Parametros incorrectos`);
  }
};

export const ValidateEmail = async (email = "") => {
  const existemail = await User.findOne({ where: { email: email } });

  if (existemail) {
    throw new Error(`Ese correo ya esta registrado`);
  }
};

export const ValidateCampos = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json(errors);
  }

  next();
};
