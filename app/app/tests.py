from django.test import TestCase
from app.calc import add, subtract


class CalcTest(TestCase):

    def test_add(self):
        """Test that two numbers are added correctly"""
        self.assertEqual(add(1, 1), 2)

    def test_subtract(self):
        """Test that two numbers are subtracted correctly"""
        self.assertEqual(subtract(1, 1), 0)
