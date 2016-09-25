import Koa from 'koa';
import koa_router from 'koa-router';

const
	app = new Koa(),
	router = koa_router();

app.use(router.routes());
app.use(router.allowedMethods());

router
.get('/', function (ctx) {
	ctx.body = 'Hello World';
})
.get('/foo', function (ctx) {
	ctx.body = 'Hello World Foo';
});

app.listen(80, () => console.log('server started 80'));

export default app;

