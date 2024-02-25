import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Riverpod Counter',
      subtitle: 'Introducción a Riverpod',
      link: '/counter-river',
      icon: Icons.add),
      
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  
  MenuItem(
      title: 'Progress Indicatior',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  
  MenuItem(
      title: 'Snackbars y Diálogos',
      subtitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  
  MenuItem(
      title: 'Animated Container',
      subtitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  
  MenuItem(
      title: 'UI Controls + Tiles',
      subtitle: 'Una serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  
  MenuItem(
      title: 'Introducción a la aplicación',
      subtitle: 'Prequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  
  MenuItem(
      title: 'InfiniteScroll y Pull to Refresh',
      subtitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
  
  MenuItem(
      title: 'Cambiar tema',
      subtitle: 'Cambiar tema de la aplicación',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
];
