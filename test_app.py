from app import app

def test_root():
    client = app.test_client()
    res = client.get('/')
    assert res.status_code == 200
    assert b"Hello from Jenkins CI/CD Pipeline!" in res.data
