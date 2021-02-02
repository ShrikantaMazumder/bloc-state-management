import 'package:bloc/bloc.dart';

enum ImageEvent { getImage }

class ImageBloc extends Bloc<ImageEvent, String> {
  ImageBloc(String initialState)
      : super(
            'https://images.unsplash.com/photo-1612018072593-479fe3f1bd3f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80');

  @override
  Stream<String> mapEventToState(ImageEvent event) async* {
    // TODO: implement mapEventToState
    yield 'https://protocoderspoint.com/wp-content/uploads/2019/10/protocoderspoint-rectangle-round-.png';
  }
}
