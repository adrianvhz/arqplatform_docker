import { LoginWithEmailPassword, registerUser } from "../../providers";
import { checkingCredentials, login, logout, loginFail } from "./authSlice";

// export const checkingAuthentication = (email, password) => {
//   return async (dispatch) => {
//     dispatch(checkingCredentials());
//   };
// };

// export const startGoogleSignIn = () => {
//   return async (dispatch) => {
//     dispatch(checkingCredentials());

//     //const result = await singInWithGoogle();

//     if (!result.ok) return dispatch(logout(result.errorMessage));

//     dispatch(login(result));
//   };
// };

export const startCreateUserWithEmailPassword = ({
  name,
  lastname,
  email,
  password,
  handleBackdrop,
}) => {
  return async (dispatch) => {
    dispatch(checkingCredentials());
    var res = await registerUser(name, lastname, email, password);
    console.log(res);
    if (res.status === 201) {
			handleBackdrop({ message: "Registro exitoso!", variant: "success" });
			dispatch(startLoginWithEmailPassword(email, password, handleBackdrop));
		} else {
			res.response.data.errors?.forEach(el => {
				handleBackdrop({ message: "Error: " + el.msg, variant: "error" });
			})
			dispatch(loginFail());
		}

		// const { ok, uid, photoURL, errorMessage } =
		// await registerUserWithEmailPassword({ email, password, displayName });

		// if (!ok) return dispatch(logout({ errorMessage }));

		// dispatch(login({ uid, photoURL, displayName, email }));
	}
}

export const startLoginWithEmailPassword = (
  email,
  password,
  handleBackdrop
) => {
  return async (dispatch) => {
    dispatch(checkingCredentials());
    const res = await LoginWithEmailPassword(email, password);
   
    if (res.status === 200) {
      
      const { data } = res.data
      const { msg } = data;
      const { token } = data.data
      const { usuario } = data.data
      const { id,name,lastname,email } = usuario
      localStorage.setItem('token',token)
      localStorage.setItem('token-init', new Date().getTime());
      handleBackdrop({ message: msg, variant: "success" });
      dispatch(login({ uid:id, name,lastname, email}));

    } else if (res.response.status > 0) {
      handleBackdrop({
        message: "Error: " + res.response.data.data.msg,
        variant: "error",
      });
      dispatch(loginFail());
    } else {
      handleBackdrop({
        message: "Internal server error, please report it.",
        variant: "error",
      });
      dispatch(loginFail());
    }
  };
};

export const startLogoutAuth = () => {
	return async (dispatch) => {
		// await logoutFirebase();
		dispatch(logout());
	};
};
