import { Router } from "express";
import {  loginUser, revalidarToken  }  from  "../../controllers/authController"
import { ValidateEmail, ValidateCampos } from "../../middlewares/user";
import { check }  from  "express-validator"
import { postUsuario } from '../../controllers/usuarioController';
import { validateJWT } from '../../middlewares/validate-jwt';

const router = Router();

router.post('/login',loginUser)
router.post('/register',[
   check("email","Esto no es un email").isEmail(),
   check("name","El nombre es obligatorio").not().isEmpty(),
   check("lastname","El nombre es obligatorio").not().isEmpty(),
   check("password","El password debe tener más de 6 de letras").isLength({min:6}),
   check('email').custom(ValidateEmail),
    ValidateCampos
],
postUsuario)

router.get('/renew',[validateJWT],revalidarToken)

export default router;
