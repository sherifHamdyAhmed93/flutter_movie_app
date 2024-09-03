
// error_codes.dart

class ErrorMessages {
  static const Map<int, String> errorCodeMessages = {
    // 2xx Success Codes
    200: 'Success.',
    201: 'The item/record was updated successfully.',
    202: 'Accepted: The request has been accepted for processing, but it has not been completed.',
    204: 'No Content: The server successfully processed the request, but is not returning any content.',

    // 3xx Redirection Codes
    304: 'Not Modified: The requested resource has not been modified since the last request.',

    // 4xx Client Error Codes
    400: 'Bad Request: The server could not understand the request due to invalid syntax.',
    401: 'Unauthorized: Authentication failed or user does not have permissions for the desired action.',
    403: 'Forbidden: You do not have access rights to the content.',
    404: 'Not Found: The requested resource could not be found on the server.',
    405: 'Method Not Allowed: The request method is known by the server but is not supported by the target resource.',
    406: 'Not Acceptable: The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.',
    408: 'Request Timeout: The server did not receive a complete request message within the time that it was prepared to wait.',
    409: 'Conflict: The request could not be completed due to a conflict with the current state of the resource.',
    410: 'Gone: The requested resource is no longer available on the server and no forwarding address is known.',
    422: 'Unprocessable Entity: The server understands the content type of the request entity, but was unable to process the contained instructions.',
    429: 'Too Many Requests: The user has sent too many requests in a given amount of time ("rate limiting").',

    // 5xx Server Error Codes
    500: 'Internal Server Error: The server has encountered a situation it does not know how to handle.',
    501: 'Not Implemented: The request method is not supported by the server and cannot be handled.',
    502: 'Bad Gateway: The server, while acting as a gateway or proxy, received an invalid response from the upstream server.',
    503: 'Service Unavailable: The server is not ready to handle the request. It is either overloaded or down for maintenance.',
    504: 'Gateway Timeout: The server, while acting as a gateway or proxy, did not get a response in time from the upstream server.',
    505: 'HTTP Version Not Supported: The HTTP version used in the request is not supported by the server.',
  };

  /// If the status code is not found, a generic error message is returned.
  static String getErrorMessage(int statusCode) {
    return errorCodeMessages[statusCode] ?? 'Unexpected Error: Something went wrong.';
  }

  /// Returns whether the status code indicates a success.
  static bool isSuccess(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

}
