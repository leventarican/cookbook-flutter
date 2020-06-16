import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

// based on https://pub.dev/packages/animations

main(List<String> args) {
  runApp(AnimationPackageExample());
}

const String _loremIpsumParagraph = 'sample text';

class AnimationPackageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Container transform'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  debugPrint('settings');
                },
              ),
            ],
          ),
          body: ListView(padding: const EdgeInsets.all(8.0), children: <Widget>[
            _OpenContainerWrapper(
              transitionType: ContainerTransitionType.fade,
              // closedBuilder: when widget is closed, show ExampleCard
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                print('closed builder');
                return _ExampleCard(openContainer: openContainer);
              },
              onClosed: (b) => print('closed'),
            ),
            const SizedBox(height: 16.0),
          ])),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.onClosed,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      // openBuilder: when widget is opened, show DetailPage
      openBuilder: (BuildContext context, VoidCallback _) {
        print('--');
        return _DetailsPage();
      },
      onClosed: onClosed,
      tappable: true,
      closedBuilder: closedBuilder,
    );
  }
}

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    this.openContainer,
    this.width,
    this.height,
    this.child,
  });

  final VoidCallback openContainer;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Image.asset('assets/images/bread1.jpg')),
          const ListTile(
            title: Text('Bread'),
            subtitle: Text('eat it'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  final result = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () => Navigator.pop(context, result),
            tooltip: 'dummy action',
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/bread0.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black54,
                        fontSize: 30.0,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  _loremIpsumParagraph,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.black54,
                        height: 1.5,
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
