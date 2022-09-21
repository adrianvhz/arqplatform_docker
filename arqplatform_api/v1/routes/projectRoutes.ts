import { Router } from 'express';
import {
  createProject,
  deleteProject,
  getProject,
  getProjectById,
  putProject,
} from '../../controllers/projectController';

const router = Router();

router.get('/', getProject);
router.post('/', createProject);
router.put('/:id', putProject);
router.delete('/:id', deleteProject);
router.get('/:id/', getProjectById);

export default router;
