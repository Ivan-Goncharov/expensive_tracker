gen:
	flutter pub run build_runner build --delete-conflicting-outputs
format:
	dart format .

fmt: format

run:
	flutter run