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
      headers = [{
        name = "Authorization";
        value = "Bearer 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";
      }];
    };
    transformed;
  };

  public func sentiment_analysis(text : Text) : async Text {
    let ic : Types.IC = actor ("aaaaa-aa");
    let host : Text = "api-inference.huggingface.co";
    let url = "https://api-inference.huggingface.co/models/cardiffnlp/twitter-roberta-base-sentiment-latest"; //HTTPS that accepts IPV6

    let idempotency_key : Text = generateUUID();
    let request_headers = [
      { name = "Host"; value = host # ":443" },
      { name = "User-Agent"; value = "http_post_sample" },
      { name = "Content-Type"; value = "application/json" },
      { name = "Idempotency-Key"; value = idempotency_key },
      {
        name = "Authorization";
        value = "Bearer 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";
      },
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

  public func summarizer(text : Text) : async Text {
    let ic : Types.IC = actor ("aaaaa-aa");
    let host : Text = "api-inference.huggingface.co";
    let url = "https://api-inference.huggingface.co/models/sshleifer/distilbart-cnn-12-6"; //HTTPS that accepts IPV6

    let idempotency_key : Text = generateUUID();
    let request_headers = [
      { name = "Host"; value = host # ":443" },
      { name = "User-Agent"; value = "http_post_sample" },
      { name = "Content-Type"; value = "application/json" },
      { name = "Idempotency-Key"; value = idempotency_key },
      {
        name = "Authorization";
        value = "Bearer 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";
      },
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

  public func chatbot(text : Text) : async Text {
    let ic : Types.IC = actor ("aaaaa-aa");
    let host : Text = "api-inference.huggingface.co";
    let url = "https://api-inference.huggingface.co/models/tiiuae/falcon-7b-instruct"; //HTTPS that accepts IPV6

    let idempotency_key : Text = generateUUID();
    let request_headers = [
      { name = "Host"; value = host # ":443" },
      { name = "User-Agent"; value = "http_post_sample" },
      { name = "Content-Type"; value = "application/json" },
      { name = "Idempotency-Key"; value = idempotency_key },
      {
        name = "Authorization";
        value = "Bearer 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";
      },
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
