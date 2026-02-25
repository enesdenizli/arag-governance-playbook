import requests
_orig_post = requests.post

def _wrapped_post(url, *args, **kwargs):
    payload = kwargs.get('json') or {}
    model = payload.get('model')
    endpoint = url.split('/v1')[-1] if '/v1' in url else url
    print(f"[trace:requests.post] endpoint={endpoint} payload_model={model}", flush=True)
    return _orig_post(url, *args, **kwargs)

requests.post = _wrapped_post
print("[trace] sitecustomize requests.post hook enabled", flush=True)
