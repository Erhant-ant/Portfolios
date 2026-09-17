import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class GoogleMapEmbed extends StatefulWidget {
  final String address;
  
  const GoogleMapEmbed({super.key, required this.address});

  @override
  State<GoogleMapEmbed> createState() => _GoogleMapEmbedState();
}

class _GoogleMapEmbedState extends State<GoogleMapEmbed> {
  late String _viewId;

  @override
  void initState() {
    super.initState();
    _viewId = 'google-map-${widget.address.hashCode}-${DateTime.now().millisecondsSinceEpoch}';
    
    ui_web.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
      final iframe = html.IFrameElement()
        ..style.border = 'none'
        ..src = 'https://maps.google.com/maps?q=${Uri.encodeComponent(widget.address)}&t=&z=14&ie=UTF8&iwloc=&output=embed'
        ..style.width = '100%'
        ..style.height = '100%';
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: HtmlElementView(viewType: _viewId),
      ),
    );
  }
}
