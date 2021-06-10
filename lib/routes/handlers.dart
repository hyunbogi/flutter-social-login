part of 'routes.dart';

final _rootHandler = Handler(
  handlerFunc: (context, params) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomeScreen(),
    );
  },
);
