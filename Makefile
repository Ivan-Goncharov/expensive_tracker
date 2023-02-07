gen:
	flutter pub run build_runner build --delete-conflicting-outputs
format:
	flutter format .

fmt: format

run:
	flutter run