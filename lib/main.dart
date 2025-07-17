import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(Icons.widgets_rounded, color: Color(0xFF5B6DCD), size: 32),
        ),
        title: const Text(
          'Kalkulator',
          style: TextStyle(
            color: Color(0xFF5B6DCD),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.1,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F0FF),
              Color(0xFFD1C4E9),
              Color(0xFFF8E1F4),
              Color(0xFFFDEFEF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                AnimatedFeatureCard(
                  title: 'Kalkulator',
                  icon: Icons.calculate_rounded,
                  color: Color(0xFF5B6DCD),
                  iconBg: Color(0xFFB3C7F7),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const KalkulatorPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                AnimatedFeatureCard(
                  title: 'Pangkat',
                  icon: Icons.trending_up_rounded,
                  color: Color(0xFF7C4DFF),
                  iconBg: Color(0xFFD1C4E9),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const PangkatPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                AnimatedFeatureCard(
                  title: 'Faktorial',
                  icon: Icons.science_rounded,
                  color: Color(0xFFFF8A65),
                  iconBg: Color(0xFFFFE0B2),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const FaktorialPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedFeatureCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color iconBg;
  final VoidCallback onTap;
  const AnimatedFeatureCard({super.key, required this.title, required this.icon, required this.color, required this.iconBg, required this.onTap});

  @override
  State<AnimatedFeatureCard> createState() => _AnimatedFeatureCardState();
}

class _AnimatedFeatureCardState extends State<AnimatedFeatureCard> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.96);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        child: GlassBox(
          width: 340,
          height: 100,
          borderRadius: 32,
          shadowColor: widget.color.withOpacity(0.18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 24),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: widget.iconBg,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(widget.icon, size: 36, color: widget.color),
              ),
              const SizedBox(width: 32),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: widget.color,
                  letterSpacing: 1.1,
                  shadows: [
                    Shadow(
                      color: widget.color.withOpacity(0.13),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlassBox extends StatelessWidget {
  final double width;
  final double? height;
  final Widget child;
  final double borderRadius;
  final Color? shadowColor;
  const GlassBox({super.key, required this.width, this.height, required this.child, this.borderRadius = 28, this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.85),
            Colors.white.withOpacity(0.55),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: (shadowColor ?? Colors.pinkAccent.withOpacity(0.18)),
            blurRadius: 32,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            blurRadius: 8,
            offset: const Offset(-4, -4),
            spreadRadius: -4,
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.18),
          width: 1.6,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: child,
        ),
      ),
    );
  }
}

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _selectedOp = '+';
  String _result = '';

  void _hitung() {
    double? n1 = double.tryParse(_num1Controller.text);
    double? n2 = double.tryParse(_num2Controller.text);
    if (n1 == null || n2 == null) {
      setState(() => _result = 'Input tidak valid');
      return;
    }
    double res = 0;
    switch (_selectedOp) {
      case '+':
        res = n1 + n2;
        break;
      case '-':
        res = n1 - n2;
        break;
      case '×':
        res = n1 * n2;
        break;
      case '÷':
        if (n2 == 0) {
          setState(() => _result = 'Tak terdefinisi');
          return;
        }
        res = n1 / n2;
        break;
    }
    setState(() => _result = res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFB388FF)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Kalkulator',
          style: TextStyle(color: Color(0xFFB388FF)),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F0FF), Color(0xFFD1C4E9), Color(0xFFF8E1F4), Color(0xFFFDEFEF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlassBox(
                    width: 320,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hasil',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB388FF),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _result.isEmpty ? '-' : _result,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6D6875),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GlassBox(
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: _num1Controller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Bilangan 1',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextField(
                            controller: _num2Controller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Bilangan 2',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 18),
                          DropdownButton<String>(
                            value: _selectedOp,
                            items: const [
                              DropdownMenuItem(value: '+', child: Text('Tambah (+)')),
                              DropdownMenuItem(value: '-', child: Text('Kurang (-)')),
                              DropdownMenuItem(value: '×', child: Text('Kali (×)')),
                              DropdownMenuItem(value: '÷', child: Text('Bagi (÷)')),
                            ],
                            onChanged: (v) => setState(() => _selectedOp = v ?? '+'),
                          ),
                          const SizedBox(height: 18),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF8BBD0),
                              foregroundColor: const Color(0xFF6D6875),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                            onPressed: _hitung,
                            child: const Text('Hitung', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PangkatPage extends StatefulWidget {
  const PangkatPage({super.key});

  @override
  State<PangkatPage> createState() => _PangkatPageState();
}

class _PangkatPageState extends State<PangkatPage> {
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  String _result = '';

  void _hitung() {
    double? base = double.tryParse(_baseController.text);
    int? exp = int.tryParse(_expController.text);
    if (base == null || exp == null) {
      setState(() => _result = 'Input tidak valid');
      return;
    }
    setState(() => _result = (base == 0 && exp == 0)
        ? 'Tak terdefinisi'
        : (base.pow(exp)).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFB388FF)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pangkat',
          style: TextStyle(color: Color(0xFFB388FF)),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F0FF), Color(0xFFD1C4E9), Color(0xFFF8E1F4), Color(0xFFFDEFEF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlassBox(
                    width: 320,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hasil',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB388FF),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _result.isEmpty ? '-' : _result,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6D6875),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GlassBox(
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: _baseController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Bilangan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextField(
                            controller: _expController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Pangkat',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 18),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB5EAEA),
                              foregroundColor: const Color(0xFF6D6875),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                            onPressed: _hitung,
                            child: const Text('Hitung', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension DoublePow on double {
  double pow(int exp) => exp == 0 ? 1 : List.filled(exp.abs(), this).reduce((a, b) => a * b) * (exp < 0 ? 1 / this : 1);
}

class FaktorialPage extends StatefulWidget {
  const FaktorialPage({super.key});

  @override
  State<FaktorialPage> createState() => _FaktorialPageState();
}

class _FaktorialPageState extends State<FaktorialPage> {
  final TextEditingController _numController = TextEditingController();
  String _result = '';

  void _hitung() {
    int? n = int.tryParse(_numController.text);
    if (n == null || n < 0) {
      setState(() => _result = 'Input tidak valid');
      return;
    }
    setState(() => _result = _factorial(n).toString());
  }

  int _factorial(int n) => n <= 1 ? 1 : n * _factorial(n - 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFB388FF)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Faktorial',
          style: TextStyle(color: Color(0xFFB388FF)),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F0FF), Color(0xFFD1C4E9), Color(0xFFF8E1F4), Color(0xFFFDEFEF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlassBox(
                    width: 320,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hasil',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB388FF),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _result.isEmpty ? '-' : _result,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6D6875),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GlassBox(
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: _numController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Bilangan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 18),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD6E0),
                              foregroundColor: const Color(0xFF6D6875),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                            onPressed: _hitung,
                            child: const Text('Hitung', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
