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
            for i in num_list:
                total += i
            return total
        except StandardError:
            return total
