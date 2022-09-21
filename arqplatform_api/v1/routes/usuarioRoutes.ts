import { Router } from "express";
import { check } from "express-validator";
import { getUsuario, getUsuarios, postUsuario, putUsuario } from "../../controllers/usuarioController";
import {  ValidateCampos } from '../../middlewares/user';

const router = Router();
router.get('/',getUsuarios);
router.get('/:id', getUsuario);
router.post('/register', [
    check("email","Esto no es un email").isEmail(),
    ValidateCampos
],
postUsuario);

router.put('/update/:id', putUsuario);

export default router;




