import { AppRouter } from "./router/AppRouter";
import { AppTheme } from './theme/AppTheme';
import { SnackbarProvider } from "notistack";

function ArqPlataformApp() {
  return (
    <SnackbarProvider maxSnack={3}>
      <AppTheme>
        <AppRouter  />
      </AppTheme>
    </SnackbarProvider>
  )
}

export default ArqPlataformApp
