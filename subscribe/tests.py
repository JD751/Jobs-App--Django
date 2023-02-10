# Create your tests here.
from selenium import webdriver
from django.test import LiveServerTestCase

class GeneralFunctionalTests(LiveServerTestCase):
    def setUp(self):
        self.browser = webdriver.Chrome()
        self.browser.implicitly_wait(3)

    def tearDown(self):
        self.browser.quit()

    def test_can_navigate_site(self):
        self.browser.get('http://localhost:8000')
        assert 'Django' in self.browser.title