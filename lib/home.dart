import 'package:flutter/material.dart';

    class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('sample text'),
        ),
        body: const Center(
        child: Text('demo app'),      
        ),
        );
    }
    }

    
