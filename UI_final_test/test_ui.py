import allure
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from time import sleep


driver = webdriver.Chrome(
        service=Service(ChromeDriverManager().install()))
driver.get("https://www.sibdar-spb.ru/")
driver.maximize_window()
current_url = driver.current_url
driver.implicitly_wait(5)


@allure.severity("critical")
@allure.title("Добавление товара")
def test_add_to_cart():
    """
    Эта функция позволяет найти кнопку добавления нужного товара в корзину.
    :return: Кнопка отрабатывает.
    """
    WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, 'button[attr_item="Грибная крошка"]'))
    )
    driver.find_element(By.CSS_SELECTOR, 'button[attr_item="Грибная крошка"]').click()
    with allure.step("Проверяем , что получен  текущий URL текущей страницы"):
        assert "https://www.sibdar-spb.ru/" in current_url

    sleep(5)

@allure.severity("normal")
@allure.title("Вход в корзину корзины")
def test_open_bask():
    """
    Эта функция открывает корзину.
    :return: Корзина открыта.
    """
    WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, '[id = bask_ic_count]'))
    )
    driver.find_element(By.CSS_SELECTOR, '[id = bask_ic_count]').click()
    sleep(5)




