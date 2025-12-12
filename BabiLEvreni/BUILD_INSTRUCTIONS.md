
# Build instructions for BabiLEvreni

1. Copy `.env.example` to `.env` and set `OPENAI_API_KEY=sk-...` (do NOT commit .env).
2. Install Flutter SDK and Android toolchain.
3. Run `flutter pub get`.
4. Run `flutter build apk --release` (or use GitHub Actions).
5. To use premium model in Actions, add secret OPENAI_API_KEY in repo settings.
