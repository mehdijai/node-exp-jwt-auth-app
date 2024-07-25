import { Response, Router } from 'express';
import AuthRoutes from './auth.route';
import appConfig from '@/config/app.config';
import { authenticateJWT } from '@/middlewares/jwt.middleware';
import HttpStatusCode from '@/utils/HTTPStatusCodes';

const routes = Router();

routes.get('/', (_, res: Response, next) => {
  res.status(HttpStatusCode.OK).json({
    name: appConfig.apiName,
    version: appConfig.apiVersion,
    dateTime: new Date().toISOString(),
    status: 'RUNNING',
  });
  next();
});

routes.get('/protected', authenticateJWT, (_, res: Response, next) => {
  res.status(HttpStatusCode.OK).json({
    name: appConfig.apiName,
    version: appConfig.apiVersion,
    dateTime: new Date().toISOString(),
    status: 'RUNNING',
    protected: true,
  });
  next();
});

routes.use('/auth', AuthRoutes);

export default routes;
