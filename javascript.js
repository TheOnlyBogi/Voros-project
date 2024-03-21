const reasonHeading = document.querySelector('.reason-heading');
const aboutTopPet = document.querySelector('.about');
const aboutCommunity = document.querySelectorAll('.about');

reasonHeading.addEventListener('mouseenter', () => {
    reasonHeading.style.color = 'cyan';
});

reasonHeading.addEventListener('mouseleave', () => {
    reasonHeading.style.color = 'black';
});

aboutTopPet.addEventListener('mouseenter', () => {
    aboutTopPet.style.color = 'cyan';
});

aboutTopPet.addEventListener('mouseleave', () => {
    aboutTopPet.style.color = 'black';
});

aboutCommunity.forEach((element) => {
    element.addEventListener('mouseenter', () => {
        element.style.color = 'cyan';
    });

    element.addEventListener('mouseleave', () => {
        element.style.color = 'black';
    });
});
