import Blob "mo:base/Blob";
import Cycles "mo:base/ExperimentalCycles";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

import Types "Types";

actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public query func transform(raw : Types.TransformArgs) : async Types.CanisterHttpResponsePayload {
    let transformed : Types.CanisterHttpResponsePayload = {
      status = raw.response.status;
      body = raw.response.body;
      headers = [
        {
          name = "Content-Security-Policy";
          value = "default-src 'self'";
        },
        { name = "Referrer-Policy"; value = "strict-origin" },
        { name = "Permissions-Policy"; value = "geolocation=(self)" },
        {
          name = "Strict-Transport-Security";
          value = "max-age=63072000";
        },
        { name = "X-Frame-Options"; value = "DENY" },
        { name = "X-Content-Type-Options"; value = "nosniff" },
      ];
    };
    transformed;
  };

  public func sentiment(text : Text) : async Text {
    let ic : Types.IC = actor ("aaaaa-aa");
    let host : Text = "fast-eimile-ssabrut-f00822ac.koyeb.app";
    let url = "https://fast-eimile-ssabrut-f00822ac.koyeb.app/sentiment"; //HTTPS that accepts IPV6

    let idempotency_key : Text = generateUUID();
    let request_headers = [
      { name = "Host"; value = host # ":443" },
      { name = "User-Agent"; value = "http_post_sample" },
      { name = "Content-Type"; value = "application/json" },
      { name = "Idempotency-Key"; value = idempotency_key },
    ];

    let request_body_json : Text = "{ \"inputs\" : \"" # text # "\" }";
    let request_body_as_Blob : Blob = Text.encodeUtf8(request_body_json);
    let request_body_as_nat8 : [Nat8] = Blob.toArray(request_body_as_Blob); // e.g [34, 34,12, 0]

    let transform_context : Types.TransformContext = {
      function = transform;
      context = Blob.fromArray([]);
    };

    // // 2.3 The HTTP request
    let http_request : Types.HttpRequestArgs = {
      url = url;
      max_response_bytes = null; //optional for request
      headers = request_headers;
      body = ?request_body_as_nat8;
      method = #post;
      transform = ?transform_context;
    };

    Cycles.add(21_850_258_000);
    let http_response : Types.HttpResponsePayload = await ic.http_request(http_request);
    let response_body : Blob = Blob.fromArray(http_response.body);
    let decoded_text : Text = switch (Text.decodeUtf8(response_body)) {
      case (null) { "No value returned" };
      case (?y) { y };
    };

    //6. RETURN RESPONSE OF THE BODY
    let result : Text = decoded_text;
    result;
  };

  public func summarize(text : Text) : async Text {
    let ic : Types.IC = actor ("aaaaa-aa");
    let host : Text = "fast-eimile-ssabrut-f00822ac.koyeb.app";
    let url = "https://fast-eimile-ssabrut-f00822ac.koyeb.app/summarize"; //HTTPS that accepts IPV6

    let idempotency_key : Text = generateUUID();
    let request_headers = [
      { name = "Host"; value = host # ":443" },
      { name = "User-Agent"; value = "http_post_sample" },
      { name = "Content-Type"; value = "application/json" },
      { name = "Idempotency-Key"; value = idempotency_key },
    ];

    let request_body_json : Text = "{ \"inputs\" : \"" # text # "\" }";
    let request_body_as_Blob : Blob = Text.encodeUtf8(request_body_json);
    let request_body_as_nat8 : [Nat8] = Blob.toArray(request_body_as_Blob); // e.g [34, 34,12, 0]

    let transform_context : Types.TransformContext = {
      function = transform;
      context = Blob.fromArray([]);
    };

    // 2.3 The HTTP request
    let http_request : Types.HttpRequestArgs = {
      url = url;
      max_response_bytes = null; //optional for request
      headers = request_headers;
      //note: type of `body` is ?[Nat8] so it is passed here as "?request_body_as_nat8" instead of "request_body_as_nat8"
      body = ?request_body_as_nat8;
      method = #post;
      transform = ?transform_context;
      // transform = null; //optional for request
    };

    Cycles.add(21_850_258_000);
    let http_response : Types.HttpResponsePayload = await ic.http_request(http_request);
    let response_body : Blob = Blob.fromArray(http_response.body);
    let decoded_text : Text = switch (Text.decodeUtf8(response_body)) {
      case (null) { "No value returned" };
      case (?y) { y };
    };

    //6. RETURN RESPONSE OF THE BODY
    let result : Text = decoded_text;
    result;
  };

  public func chat(text : Text) : async Text {
    let ic : Types.IC = actor ("aaaaa-aa");
    let host : Text = "fast-eimile-ssabrut-f00822ac.koyeb.app";
    let url = "https://fast-eimile-ssabrut-f00822ac.koyeb.app/chat"; //HTTPS that accepts IPV6

    let idempotency_key : Text = generateUUID();
    let request_headers = [
      { name = "Host"; value = host # ":443" },
      { name = "User-Agent"; value = "http_post_sample" },
      { name = "Content-Type"; value = "application/json" },
      { name = "Idempotency-Key"; value = idempotency_key },
    ];

    let request_body_json : Text = "{ \"inputs\" : \"" # text # "\" }";
    let request_body_as_Blob : Blob = Text.encodeUtf8(request_body_json);
    let request_body_as_nat8 : [Nat8] = Blob.toArray(request_body_as_Blob); // e.g [34, 34,12, 0]

    let transform_context : Types.TransformContext = {
      function = transform;
      context = Blob.fromArray([]);
    };

    // 2.3 The HTTP request
    let http_request : Types.HttpRequestArgs = {
      url = url;
      max_response_bytes = null; //optional for request
      headers = request_headers;
      //note: type of `body` is ?[Nat8] so it is passed here as "?request_body_as_nat8" instead of "request_body_as_nat8"
      body = ?request_body_as_nat8;
      method = #post;
      transform = ?transform_context;
      // transform = null; //optional for request
    };

    Cycles.add(21_850_258_000);
    let http_response : Types.HttpResponsePayload = await ic.http_request(http_request);
    let response_body : Blob = Blob.fromArray(http_response.body);
    let decoded_text : Text = switch (Text.decodeUtf8(response_body)) {
      case (null) { "No value returned" };
      case (?y) { y };
    };

    //6. RETURN RESPONSE OF THE BODY
    let result : Text = decoded_text;
    result;
  };

  func generateUUID() : Text {
    "UUID-123456789";
  };
};
