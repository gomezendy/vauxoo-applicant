"""
Sum module for Vauxoo Challenge technical test.
"""


class CalculatorClass(object):
    """
    Class that has the implementation
    needed to sum numbers of a list.
    """

    def sum(self, num_list):
        """
        Method to sum numbers of a list.
        """
        total = 0  # It will contain the sum total of numbers.
        try:
            for index_list in num_list:
                total += index_list
            return total
        except (StandardError, TypeError):
            return total
