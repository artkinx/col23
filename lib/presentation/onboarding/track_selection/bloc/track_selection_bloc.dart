import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'track_selection_event.dart';
part 'track_selection_state.dart';

class TrackSelectionBloc extends Bloc<TrackSelectionEvent, TrackSelectionState> {
  TrackSelectionBloc() : super(TrackSelectionInitial()) {
    on<TrackSelectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
