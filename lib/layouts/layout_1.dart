import 'package:flutter/material.dart';

const sampleImageUrl =
    "https://cdn.pixabay.com/photo/2018/05/22/22/40/dog-3422727_1280.jpg";

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildExample11(),
      ),
    );
  }

  Widget _buildExample1() {
    return Center(
      child: Image.network(sampleImageUrl),
    );
  }

  Widget _buildExample2() {
    return Container(
        padding: const EdgeInsets.all(16.0), child: const BorderedImage());
  }

  Widget _buildExample3() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const BorderedImage(),
      ),
    );
  }

  Widget _buildExample4() {
    return const Row(
      children: [
        BorderedImage(),
        BorderedImage(),
      ],
    );
  }

  Widget _buildExample5() {
    return const Row(
      children: [
        Column(
          children: [
            BorderedImage(),
            Text('Dash 1'),
          ],
        ),
        Column(
          children: [
            BorderedImage(),
            Text('Dash 2'),
          ],
        ),
      ],
    );
  }

  Widget _buildExample6() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BorderedImage(),
        BorderedImage(),
        BorderedImage(),
      ],
    );
  }

  Widget _buildExample7() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BorderedImage(),
        BorderedImage(),
        BorderedImage(),
      ],
    );
  }

  Widget _buildExample8() {
    return const Row(
      children: [
        BorderedImage(width: 150, height: 150),
        BorderedImage(width: 150, height: 150),
        BorderedImage(width: 150, height: 150),
      ],
    );
  }

  Widget _buildExample9() {
    return const Row(
      children: [
        Expanded(child: BorderedImage(width: 150, height: 150)),
        Expanded(child: BorderedImage(width: 150, height: 150)),
        Expanded(child: BorderedImage(width: 150, height: 150)),
      ],
    );
  }

  Widget _buildExample10() {
    return const Row(
      children: [
        Expanded(child: BorderedImage(width: 150, height: 150)),
        Expanded(flex: 2, child: BorderedImage(width: 150, height: 150)),
        Expanded(child: BorderedImage(width: 150, height: 150)),
      ],
    );
  }

  Widget _buildExample11() {
    return ListView(
      children: const [
        BorderedImage(),
        BorderedImage(),
        BorderedImage(),
        BorderedImage(),
      ],
    );
  }
}

class BorderedImage extends StatelessWidget {
  const BorderedImage({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      sampleImageUrl,
      width: width,
      height: height,
    );
  }
}
