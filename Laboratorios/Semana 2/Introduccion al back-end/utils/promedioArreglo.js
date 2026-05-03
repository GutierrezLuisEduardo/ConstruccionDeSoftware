function promedioArreglo(arr) {
    let sum = 0;

    for (const el of arr) {
        sum+=el;
    }

    let avg = sum/arr.length;
    return avg;
}


module.exports = { promedioArreglo };
