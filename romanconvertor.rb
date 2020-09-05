def fromRoman(romanNumber)
    i = 0
    valuesArray = Array.new
    while i < romanNumber.length do
        if(romanNumber[i] == 'M') 
            valuesArray.push(1000)
        elsif(romanNumber[i] == 'D')
            valuesArray.push(500)
        elsif(romanNumber[i] == 'C')
            valuesArray.push(100)
        elsif(romanNumber[i] == 'L')
            valuesArray.push(50)
        elsif(romanNumber[i] == 'X')
            valuesArray.push(10)
        elsif(romanNumber[i] == 'V')
            valuesArray.push(5)
        elsif(romanNumber[i] == 'I')
            valuesArray.push(1)
        else 
            raise TypeError
        end
        i += 1
    end

    i = 0
    finalArray = Array.new
    while i < romanNumber.length do
        if valuesArray[i + 1] && valuesArray[i] < valuesArray[i + 1] 
            finalArray.push(valuesArray[i + 1] - valuesArray[i])
            i += 2
        else
            finalArray.push(valuesArray[i])
            i += 1
        end
    end

    i = 0
    result = 0
    while i < finalArray.length do
        result += finalArray[i]
        i += 1
    end
    return result
end

def getRomanCharacter(arabicNumber)
    if arabicNumber >= 1000
        return "M"
    elsif arabicNumber >= 500
        return "D"
    elsif arabicNumber >= 100
        return "C"
    elsif arabicNumber >= 50
        return "L"
    elsif arabicNumber >= 10
        return "X"
    elsif arabicNumber >= 5
        return "V"
    elsif arabicNumber >= 1
        return "I"
    elsif arabicNumber > 3999
        raise RangeError
    else 
        raise RangeError
    end
end

def toRoman(arabicNumber)
    romanNumeral = ""
    valueToBeSubtracted = 0 
    keepGoing = true
    i = 0

    while keepGoing do 
        if arabicNumber > 3999
            keepGoing = false
            raise RangeError
        elsif arabicNumber >= 1000
            romanNumeral = romanNumeral + "M"
            valueToBeSubtracted = 1000
        elsif arabicNumber >= 500
            if arabicNumber >= 900
                romanNumeral = romanNumeral + "CM"
                valueToBeSubtracted = 900
            else
                romanNumeral = romanNumeral + "D"
                valueToBeSubtracted = 500
            end
        elsif arabicNumber >= 100
            if arabicNumber >= 400
                romanNumeral = romanNumeral + "CD"
                valueToBeSubtracted = 400
            else
                romanNumeral = romanNumeral + "C"
                valueToBeSubtracted = 100
            end
        elsif arabicNumber >= 50
            if arabicNumber >= 90
                romanNumeral = romanNumeral + "XC"
                valueToBeSubtracted = 90
            else
                romanNumeral = romanNumeral + "L"
                valueToBeSubtracted = 50
            end
        elsif arabicNumber >= 10
            if arabicNumber >= 40
                romanNumeral = romanNumeral + "XL"
                valueToBeSubtracted = 40
            else
                romanNumeral = romanNumeral + "X"
                valueToBeSubtracted = 10
            end
        elsif arabicNumber >= 5
            if arabicNumber >= 9
                romanNumeral = romanNumeral + "IX"
                valueToBeSubtracted = 9
            else
                romanNumeral = romanNumeral + "V"
                valueToBeSubtracted = 5
            end
        elsif arabicNumber >= 1
            if arabicNumber >= 4
                romanNumeral = romanNumeral + "IV"
                valueToBeSubtracted = 4
            else
                romanNumeral = romanNumeral + "I"
                valueToBeSubtracted = 1
            end
        elsif arabicNumber == 0
            if i == 0
                raise RangeError
            else
                valueToBeSubtracted = 0 
            end
            keepGoing = false
        else 
            keepGoing = false
            raise RangeError
        end
        arabicNumber = arabicNumber - valueToBeSubtracted
        i += 1
    end
    return romanNumeral
end

puts toRoman 1494



