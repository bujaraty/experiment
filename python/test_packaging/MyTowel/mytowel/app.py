from pkg_resources import resource_string


def my_pkg_resource():
    foo_config = resource_string(__name__, 'MyTowel/CBV/test.cbv')
    print 'hello'
    print foo_config
