
import 'package:flutter/material.dart';

abstract class PageScaffold{
  PreferredSizeWidget buildAppBar(BuildContext context);
  Widget buildBody(BuildContext context);
}