import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/core/constants/app_texts.dart';
import 'package:studenthub/core/constants/colors.dart';
import '../view_models/register_view_model.dart';
import '../widgets/app_input.dart';
import '../widgets/app_buton.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTexts.appName,
                      style: GoogleFonts.pacifico(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: AppInput(
                            hintText: "Nom",
                            onChanged: model.setFirstname,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AppInput(
                            hintText: "Prénom",
                            onChanged: model.setLastname,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    AppInput(hintText: "Email", onChanged: model.setEmail),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Filières",
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.inputBorder,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.inputBorder,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.secondary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      value: model.field.isEmpty ? null : model.field,
                      items: [
                        DropdownMenuItem(
                          value: "Informatique",
                          child: Text(
                            "Informatique",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Marketing",
                          child: Text(
                            "Marketing",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Finance",
                          child: Text(
                            "Finance",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "RH",
                          child: Text(
                            "RH",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) => model.setField(value ?? ""),
                      dropdownColor: Colors.white,
                      menuMaxHeight: 200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Niveau",
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.inputBorder,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.inputBorder,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.secondary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      value: model.level.isEmpty ? null : model.level,
                      items: [
                        DropdownMenuItem(
                          value: "B1",
                          child: Text(
                            "B1",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "B2",
                          child: Text(
                            "B2",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "B3",
                          child: Text(
                            "B3",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "M1",
                          child: Text(
                            "M1",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "M2",
                          child: Text(
                            "M2",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) => model.setLevel(value ?? ""),
                      dropdownColor: Colors.white,
                      menuMaxHeight: 200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    SizedBox(height: 16),
                    AppInput(
                      obscureText: true,
                      hintText: "Mot de passe",
                      onChanged: model.setPassword,
                      suffixIcon: LucideIcons.eye,
                    ),
                    SizedBox(height: 16),
                    AppInput(
                      obscureText: true,
                      hintText: "Confirmer le mot de passe",
                      onChanged: model.setConfirmPassword,
                    ),
                    SizedBox(height: 16),
                    _TermsCheckbox(),
                    if (model.errorMessage != null)
                      Text(
                        model.errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        text: "S'inscrire",
                        isLoading: model.isLoading,
                        onPressed: model.register,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTexts.alreadyHaveAccount,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Naviguer vers la page de connexion
                          },
                          child: Text(
                            "Se connecter",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "ou",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    ConnexionAvecEstiam(),
                    SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Icon(Icons.facebook, color: Colors.black, size: 32),
                    //     SizedBox(width: 16),
                    //     Icon(Icons.camera_alt, color: Colors.pink, size: 32), // Instagram
                    //     SizedBox(width: 16),
                    //     Icon(Icons.apple, color: Colors.black, size: 32),
                    //     SizedBox(width: 16),
                    //     Icon(Icons.alternate_email, color: Colors.lightBlue, size: 32), // Twitter
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TermsCheckbox extends StatefulWidget {
  @override
  State<_TermsCheckbox> createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<_TermsCheckbox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: checked,
          onChanged: (val) {
            setState(() {
              checked = val ?? false;
            });
          },
          activeColor: AppColors.primary,

          side: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'En vous inscrivant, vous acceptez les ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'conditions d\'utilisation',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          // Open Terms of Service
                        },
                ),
                // TextSpan(text: ' and '),
                // TextSpan(
                //   text: 'et la Politique de confidentialité',
                //   style: TextStyle(color: AppColors.primary, decoration: TextDecoration.underline),
                //   recognizer: TapGestureRecognizer()..onTap = () {
                //     // Open Privacy Policy
                //   },
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ConnexionAvecEstiam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          side: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          backgroundColor: AppColors.secondary,
        ),
        onPressed: () {
          // TODO: Implement Google sign up
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://estiam-france.s3.eu-west-3.amazonaws.com/media/ab/4a/8651e5478ad19f5052220226b0f4.jpg',
              height: 24,
              width: 24,
            ),
            SizedBox(width: 12),
            Text(
              'Se connecter avec Estiam',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
