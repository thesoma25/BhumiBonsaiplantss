# PowerShell script to update footers in all HTML files

$htmlFiles = Get-ChildItem -Path "c:\yt auto" -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Footer matching the provided image and website theme
    $newFooterContent = @"
<footer class="bg-[#f0f5ed] text-[#333a2e] pt-10 pb-8 px-4 border-t border-[#dde5d9]">
    <div class="container mx-auto">
        <!-- Social Media Links -->
        <div class="flex justify-center items-center space-x-6 mb-8 pb-8 border-b border-[#dde5d9]">
            <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M224,64a8,8,0,0,1-8,8H40a8,8,0,0,1,0-16H216A8,8,0,0,1,224,64Zm-8,64H40a8,8,0,0,0,0,16H216a8,8,0,0,0,0-16Zm-8,72H40a8,8,0,0,0,0,16H208a8,8,0,0,0,0-16Z'></path></svg> <!-- Placeholder for YouTube -->
                <span class="text-xs font-medium">YOUTUBE</span>
            </a>
            <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                 <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24Zm8,191.63V152h24a8,8,0,0,0,0-16H136V112a16,16,0,0,1,16-16h16a8,8,0,0,0,0-16H152a32,32,0,0,0-32,32v24H96a8,8,0,0,0,0,16h24v63.63a88,88,0,1,1,16,0Z'></path></svg>
                <span class="text-xs font-medium">FACEBOOK</span>
            </a>
            <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M128,80a48,48,0,1,0,48,48A48.05,48.05,0,0,0,128,80Zm0,80a32,32,0,1,1,32-32A32,32,0,0,1,128,160ZM176,24H80A56.06,56.06,0,0,0,24,80v96a56.06,56.06,0,0,0,56,56h96a56.06,56.06,0,0,0,56-56V80A56.06,56.06,0,0,0,176,24Zm40,152a40,40,0,0,1-40,40H80a40,40,0,0,1-40-40V80A40,40,0,0,1,80,40h96a40,40,0,0,1,40,40ZM192,76a12,12,0,1,1-12-12A12,12,0,0,1,192,76Z'></path></svg>
                <span class="text-xs font-medium">INSTAGRAM</span>
            </a>
            <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                 <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M128,24a104,104,0,1,0,232,128,104.12,104.12,0,0,0-104-104Zm0,192a88,88,0,1,1,88-88A88.1,88.1,0,0,1,128,216Zm0-160a72,72,0,1,0,72,72A72.08,72.08,0,0,0,128,56Zm0,128a56,56,0,1,1,56-56A56.06,56.06,0,0,1,128,184Z'></path></svg> <!-- Placeholder for Dribbble -->
                <span class="text-xs font-medium">DRIBBBLE</span>
            </a>
            <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                 <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M208,32H48A16,16,0,0,0,32,48V208a16,16,0,0,0,16,16H208a16,16,0,0,0,16-16V48A16,16,0,0,0,208,32ZM128,184a56,56,0,1,1,56-56A56.06,56.06,0,0,1,128,184Z'></path></svg> <!-- Placeholder for Pinterest -->
                <span class="text-xs font-medium">PINTEREST</span>
            </a>
            <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M247.39,68.94A8,8,0,0,0,240,64H209.57A48.66,48.66,0,0,0,168.1,40a46.91,46.91,0,0,0-33.75,13.7A47.9,47.9,0,0,0,120,88v6.09C79.74,83.47,46.81,50.72,46.46,50.37a8,8,0,0,0-13.65,4.92c-4.31,47.79,9.57,79.77,22,98.18a110.93,110.93,0,0,0,21.88,24.2c-15.23,17.53-39.21,26.74-39.47,26.84a8,8,0,0,0-3.85,11.93c.75,1.12,3.75,5.05,11.08,8.72C53.51,229.7,65.48,232,80,232c70.67,0,129.72-54.42,135.75-124.44l29.91-29.9A8,8,0,0,0,247.39,68.94Zm-45,29.41a8,8,0,0,0-2.32,5.14C196,166.58,143.28,216,80,216c-10.56,0-18-1.4-23.22-3.08,11.51-6.25,27.56-17,37.88-32.48A8,8,0,0,0,92,169.08c-.47-.27-43.91-26.34-44-96,16,13,45.25,33.17,78.67,38.79A8,8,0,0,0,136,104V88a32,32,0,0,1,9.6-22.92A30.94,30.94,0,0,1,167.9,56c12.66.16,24.49,7.88,29.44,19.21A8,8,0,0,0,204.67,80h16Z'></path></svg>
                <span class="text-xs font-medium">TWITTER</span>
            </a>
             <a href="#" onclick="playClickSound()" class="text-[#587451] hover:text-[#8cd279] transition-colors flex items-center space-x-2">
                <svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' viewBox='0 0 256 256'><path d='M48,40H208a16,16,0,0,1,16,16V200a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V56A16,16,0,0,1,48,40ZM80,88a16,16,0,1,0-16-16A16,16,0,0,0,80,88Zm0,48a16,16,0,1,0,16,16A16,16,0,0,0,80,136Zm0,64a16,16,0,1,0,16,16A16,16,0,0,0,80,200Zm128-88H120a8,8,0,0,0,0,16h88a8,8,0,0,0,0-16Zm0-48H120a8,8,0,0,0,0,16h88a8,8,0,0,0,0-16Z'></path></svg> <!-- Placeholder for RSS -->
                <span class="text-xs font-medium">RSS</span>
            </a>
        </div>

        <!-- Main Footer Content -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
            <!-- Column 1: Subscribe -->
            <div class="text-left">
                <h5 class="text-lg font-semibold text-[#121810] mb-1">Subscribe</h5>
                <hr class="border-[#8cd279] border-t-2 w-1/4 mb-4">
                <h2 class="text-3xl font-bold text-[#121810] mb-2" style="font-family: 'Times New Roman', Times, serif;">Bhumi Bonsai</h2>
                <p class="text-sm text-[#587451] mb-3">Weekly Email Updates</p>
                <p class="text-sm text-[#587451] mb-4">
                    We got tons of fascinating articles, videos and freebies for you every week!
                </p>
                <button onclick="playClickSound()" class="bg-[#121810] text-[#f0f5ed] px-6 py-2 rounded-md text-sm font-semibold hover:bg-[#333a2e] transition-colors">SUBSCRIBE</button>
            </div>

            <!-- Column 2: Design Blog & About Us -->
            <div class="text-left">
                <h5 class="text-lg font-semibold text-[#587451] mb-4">Bonsai Blog</h5>
                <div class="grid grid-cols-2 gap-x-4 mb-6">
                    <div>
                        <ul class="space-y-2 text-sm">
                            <li><a href="10blogandlearn.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Care Guides</a></li>
                            <li><a href="10blogandlearn.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Styling Tips</a></li>
                            <li><a href="10blogandlearn.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Species Spotlights</a></li>
                        </ul>
                    </div>
                    <div>
                        <ul class="space-y-2 text-sm">
                            <li><a href="10blogandlearn.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Inspiration</a></li>
                            <li><a href="23comunity.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Community</a></li>
                            <li><a href="9careandguide.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Tools & Supplies</a></li>
                        </ul>
                    </div>
                </div>
                <h5 class="text-lg font-semibold text-[#121810] mb-1">About Us</h5>
                 <hr class="border-[#8cd279] border-t-2 w-1/4 mb-4">
                <p class="text-sm text-[#587451]">
                    Welcome to Bhumi Bonsai – a passionate community dedicated to the art of bonsai. We aim to deliver fresh inspiration & trends, as well as the most essential guides & tutorials for your bonsai journey.
                </p>
            </div>

            <!-- Column 3: Company -->
            <div class="text-left">
                <h5 class="text-lg font-semibold text-[#587451] mb-4">Company</h5>
                <ul class="space-y-2 text-sm">
                    <li><a href="2shopOverview.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Shop All</a></li>
                    <li><a href="11contact.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Contact Us</a></li>
                    <li><a href="13faq.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">FAQs</a></li> <!-- Assuming 13faq.html is for FAQs -->
                    <li><a href="13privacypolicy.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Privacy Policy</a></li>
                    <li><a href="14termsandcondation.html" class="text-[#121810] hover:text-[#8cd279] transition-colors font-medium">Terms and Conditions</a></li>
                </ul>
            </div>
        </div>

        <!-- Copyright -->
        <div class="text-center text-[#668a5c] text-xs pt-8 border-t border-[#dde5d9]">
            &copy; 2025 Somesh. All rights reserved. Bhumi Bonsai - Nurturing nature, one tree at a time.
        </div>
    </div>
</footer>
"@
    $content = $content -replace '(<footer class="flex justify-center">)[\s\S]*?(<\/footer>)', $newFooterContent

    # Remove old social media and copyright, as they are in the new footer
    $content = $content -replace '(<div class="flex flex-wrap justify-center gap-4">)[\s\S]*?(<p class="text-\[#668a5c\] text-base font-normal leading-normal">@2024 Bhumi Bonsai. All rights reserved.<\/p>)', ''

    
    # Add click sound to social media icons
    $content = $content -replace '<a href="#">(\s*)<div class="text-\[#[0-9a-f]+\]" data-icon="InstagramLogo"', '<a href="#" onclick="playClickSound()">$1<div class="text-[#668a5c]" data-icon="InstagramLogo"'
    $content = $content -replace '<a href="#">(\s*)<div class="text-\[#[0-9a-f]+\]" data-icon="FacebookLogo"', '<a href="#" onclick="playClickSound()">$1<div class="text-[#668a5c]" data-icon="FacebookLogo"'
    $content = $content -replace '<a href="#">(\s*)<div class="text-\[#[0-9a-f]+\]" data-icon="TwitterLogo"', '<a href="#" onclick="playClickSound()">$1<div class="text-[#668a5c]" data-icon="TwitterLogo"'
    
    # Ensure the main footer replacement covers all cases
    # The line below is now redundant due to the comprehensive $newFooterContent replacement
    # $content = $content -replace '<p class="text-\[#[0-9a-f]+\] text-base font-normal leading-normal">@2024 Bhumi Bonsai. All rights reserved.</p>', '<p class="text-[#668a5c] text-base font-normal leading-normal">@2025 Somesh. All rights reserved.</p>''
    
    # Save the updated content back to the file
    Set-Content -Path $file.FullName -Value $content
    
    Write-Host "Updated footer in $($file.Name)"
}

Write-Host "All footers have been updated successfully!"