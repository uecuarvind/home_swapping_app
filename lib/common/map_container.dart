import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapContainer extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double height;
  final double width;
  final String markerIconPath;

  const GoogleMapContainer({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.height,
    required this.width,
    required this.markerIconPath,
  });

  @override
  State<GoogleMapContainer>  createState() => _GoogleMapContainerState();
}

class _GoogleMapContainerState extends State<GoogleMapContainer> {
  late BitmapDescriptor _customMarker;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  void _loadCustomMarker() async {
    _customMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      widget.markerIconPath,
    );
    setState(() {}); // Trigger a rebuild to apply the custom marker.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 13.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('custom-marker'),
              position: LatLng(widget.latitude, widget.longitude),
              icon: _customMarker,
            ),
          },
        ),
      ),
    );
  }
}
