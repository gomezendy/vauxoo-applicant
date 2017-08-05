"""
Module for determining prime numbers.
"""


class PrimeClass(object):
    """
    Class that has the implementation
    needed to determine prime numbers.
    """

    def is_prime(self, num_int):
        """
        Method to determining prime numbers.
        Only accept integer.
        """
        try:
            if num_int < 2:
                return False
            for i in range(2, num_int):
                if(num_int % i) == 0:
                    return False
        except:
            return False
        return True
