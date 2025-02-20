import requests
import allure


base_url = "https://www.sibdar-spb.ru/"


@allure.severity("critical")
@allure.step("Добавление товара")
def test_add():
    """
    Эта функция добавляет товар.
    :return: Товар добавлен.
    """
    body = {
        "idCookie": "416510", "idProd": "178", "type": "add"
    }
    resp = requests.post(base_url + 'ajax/basketOrder.php', json=body)
    assert resp.status_code == 200


@allure.severity("normal")
@allure.step("Обновление корзины")
def test_update():
    """
    Эта функция обнавляет количество товара.
    :return: Количество обнавлено.
    """
    body = {
        "idCookie": "416510", "idProd": 178, "type": "plus"
    }
    resp = requests.post(base_url + 'ajax/basketOrder.php', json=body)
    assert resp.status_code == 200


@allure.severity("normal")
@allure.step("Удаление товара")
def test_delete():
    """
    Эта функция удаляет товар.
    :return: Товар удален.
    """
    body = {
        "idCookie": "416510", "idProd": 178, "type": "delete"
    }
    resp = requests.post(base_url + 'ajax/basketOrder.php', json=body)
    assert resp.status_code == 200