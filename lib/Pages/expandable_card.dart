import 'package:active4capk/pages/fitness_element.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableCard extends StatefulWidget {
  final FitnessElement element;

  const ExpandableCard({required this.element});

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(widget.element.icon, color: Colors.orange),
        title: Text(
          widget.element.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
          color: Colors.grey,
        ),
        onExpansionChanged: (bool expanding) => 
          setState(() => _isExpanded = expanding),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.element.description,
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
                SizedBox(height: 12),
                Text(
                  'Contoh Latihan:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                ...widget.element.examples.map((example) => 
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_right, size: 16, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(example),
                      ],
                    ),
                  )
                ).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}