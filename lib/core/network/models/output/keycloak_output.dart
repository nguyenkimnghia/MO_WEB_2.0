class KeyCloakOutput {
  final String accessToken;
  final int expiresIn;
  final int refreshExpiresIn;
  final String refreshToken;
  final String tokenType;
  final String sessionState;
  final String scope;

  KeyCloakOutput({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.sessionState,
    required this.scope
  });


  factory KeyCloakOutput.fromJson(Map<String, dynamic> json) =>
      KeyCloakOutput(
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        refreshExpiresIn: json["refresh_expires_in"],
        refreshToken: json["refresh_token"],
        tokenType: json["token_type"],
        sessionState: json["session_state"],
        scope: json["scope"],
      );
}