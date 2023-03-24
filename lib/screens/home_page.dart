import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_cubit/cubits/internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: BlocConsumer<InternetCubit,InternetState> (
                listener: (context,state) {
                  if(state == InternetState.gained) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Internet connected'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                  else if(state == InternetState.lost) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Internet not connected'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context,state) {
                  if(state == InternetState.gained) {
                    return const Text('Connected');
                  } else if (state == InternetState.lost) {
                    return const Text('Not Connected');
                  } else {
                    return const Text('Loading..');
                  }
                },
              )


            //BlocBuilder
            // BlocBuilder<InternetBloc,InternetState>(
            //   builder: (context, state) {
            //     if(state is InternetGainedState) {
            //       return Text('Connected');
            //     } else if (state is InternetLostState) {
            //       return Text('Not Connected');
            //     } else {
            //       return Text('Loading..');
            //     }
            //   },
            // )
          )
      ),
    );
  }
}
