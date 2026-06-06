import 'package:flutter/material.dart';

import '../../../core/localization/locale_keys.dart';

class ProfileRecentLogs extends StatelessWidget {
  const ProfileRecentLogs({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final items = _sampleLogs();

    return Column(
      crossAxisAlignment: isRtl
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: Row(
            mainAxisAlignment: isRtl
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isRtl ? 'سجلاتي الأخيرة' : 'Recent Logs',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  isRtl ? 'عرض الكل' : 'View all',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF95D4B3),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            reverse: isRtl,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final it = items[index];
              return _LogCard(item: it, isRtl: isRtl);
            },
          ),
        ),
      ],
    );
  }

  List<_RecentLog> _sampleLogs() => const [
    _RecentLog(
      title: 'سليم - صحة جيدة',
      date: '08 أكتوبر 2023',
      image:
          'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=800&q=60',
    ),
    _RecentLog(
      title: 'تفّرج الحمضيّات',
      date: '12 أكتوبر 2023',
      image: 'https://upload.wikimedia.org/wikipedia/commons/e/e4/Lemon.jpg',
    ),
    _RecentLog(
      title: 'إصابة خفيفة',
      date: '20 سبتمبر 2023',
      image: 'https://media.elaard.com/img/ARD/4/43213.jpg',
    ),
  ];
}

class _RecentLog {
  final String title;
  final String date;
  final String image;

  const _RecentLog({
    required this.title,
    required this.date,
    required this.image,
  });
}

class _LogCard extends StatelessWidget {
  const _LogCard({required this.item, required this.isRtl});

  final _RecentLog item;
  final bool isRtl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: const Color(0xFF0F1513),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.03)),
      ),
      child: Column(
        crossAxisAlignment: isRtl
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.network(
              item.image,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: isRtl
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    textAlign: isRtl ? TextAlign.right : TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF95D4B3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.date,
                    textAlign: isRtl ? TextAlign.right : TextAlign.left,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
