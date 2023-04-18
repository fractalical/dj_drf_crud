from unittest import TestCase
from rest_framework.test import APIClient


class TestSampleView(TestCase):
    def test_view_200(self):
        url = '/api/v1/products/'
        client = APIClient()
        response = client.get(url)

        self.assertEqual(response.status_code, 200)

    def test_view_201(self):
        url = '/api/v1/products/'
        client = APIClient()
        response = client.post(
            url,
            {
                "title": "test",
                "description": "create from test"
            }
        )

        self.assertEqual(response.status_code, 201)
