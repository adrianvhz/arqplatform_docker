import  bcryptjs  from "bcryptjs";

export const bcrypPassword = (password:string)=> {

    //encriptar usuario
    const saltRount = 10
    
    return bcryptjs.hashSync(password,saltRount)
}

